#Dummy module used to install C-Data suite
module CData

parsestring(::Type{AbstractString}, s::AbstractString) = s
parsestring{T}(::Type{T}, s::AbstractString) = parse(T, s)

function input{T}(::Type{T}, prompt::AbstractString, default)
	println(prompt)
	print("[$default]: ")
	result = parsestring(T, strip(readline(STDIN)))
	if "" == result
		result = default
	end
	return result
end

function isinstalled(modname::AbstractString)
	result = true
	try
		Pkg.installed(modname)
	catch
		result = false
	end
	return result
end

#Install module using Pkg.clone(), if not installed:
function cond_install_clone(path::AbstractString, modname::AbstractString; jl_suffix::Bool = true)
	suffix = jl_suffix? ".jl.git": ""
	println("\nInstalling module $modname...")

	if isinstalled(modname)
		println("        already present.")
	else
		pkgpath = joinpath(path, "$modname$suffix")
		Pkg.clone(pkgpath)
		println("done.")
	end
end

#Vectorize cond_install_clone:
function cond_install_clone(path::AbstractString, v::Vector; jl_suffix::Bool = true)
	for modname in v
		cond_install_clone(path, modname, jl_suffix=jl_suffix)
	end
end

function install()
	const path_laforge = "git://github.com/ma-laforge"

	modlist = [
		"FileIO2", "MDDatasets", "NumericIO",
		"InspectDR", "GracePlot",
		"EasyPlot", "EasyPlotInspect", "EasyPlotGrace", "EasyPlotPlots", "EasyData",
		"CircuitAnalysis", "SignalProcessing", "NetwAnalysis",
      "CppSimData", "SpiceData", "LibPSF", "LibPSF2", "PSFWrite", "EDAData",
	]
	#NOTE: install CppSimData/LibPSF for sample data files only.
	cond_install_clone(path_laforge, modlist)

	if "Y" == uppercase(input(AbstractString, "Install PyPlot/PyCall dependencies (y/n)?", "y"))
		modlist = [
			"EasyPlotMPL", "EasyPlotQwt"
		]
		cond_install_clone(path_laforge, modlist)
	end

	println("\n\nPackage installation complete.")
	println("Refresh out-of-date packages using \"Pkg.update()\".")
end

end #module CData
