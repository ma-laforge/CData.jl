#Dummy module used to install C-Data suite
module CData
using Pkg

parsestring(::Type{String}, s::AbstractString) = s
parsestring(::Type{T}, s::AbstractString) where T = parse(T, s)

function input(::Type{T}, prompt::String, default) where T
	println(prompt)
	print("[$default]: ")
	result = parsestring(T, strip(readline(stdin)))
	if "" == result
		result = default
	end
	return result
end

function isinstalled(modname::String)
	return in(modname, keys(Pkg.installed()))
end

#Install module using Pkg.clone(), if not installed:
function cond_install_clone(path::String, modname::String; jl_suffix::Bool = true)
	suffix = jl_suffix ? ".jl.git" : ""
	println("\nInstalling module $modname...")

	if isinstalled(modname)
		println("        already present.")
	else
		pkgpath = joinpath(path, "$modname$suffix")
		pkg"add $pkgpath"
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
	path_laforge = "git://github.com/ma-laforge" #WANTCONST

	modlist = [
		"FileIO2", "MDDatasets", "NumericIO",
		"InspectDR", "GracePlot",
		"EasyPlot", "EasyData", "EasyPlotInspect", "EasyPlotGrace", #"EasyPlotPlots", #Not working
		"CircuitAnalysis", "SignalProcessing", "NetwAnalysis",
      "SpiceData", "LibPSF", "PSFWrite", "EDAData",
		"CppSimData", "LibPSFC", #NOTE: install CppSimData/LibPSFC for sample data files only.
	]
	cond_install_clone(path_laforge, modlist)

	if "Y" == uppercase(input(String, "Install PyPlot/PyCall dependencies (y/n)?", "y"))
		modlist = [
			"EasyPlotMPL", #"EasyPlotQwt" #Not working
		]
		cond_install_clone(path_laforge, modlist)
	end

	println("\n\nPackage installation complete.")
	println("Refresh out-of-date packages using \"Pkg.update()\".")
end

end #module CData
