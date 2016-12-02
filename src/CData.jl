#Dummy module used to install C-Data suite
module CData

parsestring(::Type{String}, s::String) = s
parsestring{T}(::Type{T}, s::String) = parse(T, s)

function input{T}(::Type{T}, prompt::String, default)
	println(prompt)
	print("[$default]: ")
	result = parsestring(T, strip(readline(STDIN)))
	if "" == result
		result = default
	end
	return result
end

function isinstalled(modname::String)
	try
		if Pkg.installed(modname) != nothing
			return true
		end
	end
	return false
end

#Install module using Pkg.clone(), if not installed:
function cond_install_clone(path::String, modname::String; jl_suffix::Bool = true)
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
function cond_install_clone(path::String, v::Vector; jl_suffix::Bool = true)
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
      "CppSimData", "SpiceData", "LibPSFC", "LibPSF", "PSFWrite", "EDAData",
	]
	#NOTE: install CppSimData/LibPSFC for sample data files only.
	cond_install_clone(path_laforge, modlist)

	if "Y" == uppercase(input(String, "Install PyPlot/PyCall dependencies (y/n)?", "y"))
		modlist = [
			"EasyPlotMPL", "EasyPlotQwt"
		]
		cond_install_clone(path_laforge, modlist)
	end

	println("\n\nPackage installation complete.")
	println("Refresh out-of-date packages using \"Pkg.update()\".")
end

end #module CData
