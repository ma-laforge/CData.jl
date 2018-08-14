# :art: Galleries (Sample Output) :art:

[:satellite: SignalProcessing.jl](https://github.com/ma-laforge/FileRepo/tree/master/SignalProcessing/sampleplots/README.md), [:chart_with_upwards_trend: InspectDR.jl](https://github.com/ma-laforge/FileRepo/tree/master/InspectDR/sampleplots/README.md) (might be out of date).

# CData.jl: (C-Data) Analysis/Visualization Suite

"Focus on the analysis itself, not data manipulation"

| <img src="https://github.com/ma-laforge/FileRepo/blob/master/InspectDR/sampleplots/demo11.png" width="425"> | <img src="https://github.com/ma-laforge/FileRepo/blob/master/InspectDR/sampleplots/demo2.png" width="425"> |
| :---: | :---: |

| <img src="https://github.com/ma-laforge/FileRepo/blob/master/SignalProcessing/sampleplots/demo15.png" width="850"> |
| :---: |

## Description

CData.jl (C-Data) provides a collection of tools to simplify the analysis of large multi-dimensional datasets & better visualize (*see*) mathematical relationships buried within.

In other words, the goal is to provide analysis tools that lead to minimal code, written in a *natural*, and *readable* fashion.  In particular, the tools will help perform the following operations:

1. Read in complex multi-dimensional input data.
1. Perform the same operation on all elements (usually) without having to write explicit loops.
1. Quickly organize and plot the results in a way that sheds light on the studied phenomenon.
1. Save data and plot configuration to a single .hdf5 file.
1. Reload plot data for further investigation at a later time.
1. Render plots using different plotting backends (possibly at a later date).

The C-Data toolkit was initially designed to assist with circuit-data (C-Data) analysis.  That being said, C-Data provides a generic toolkit that can also be applied to other scientific fields.

The C-Data toolkit is implemented in the Julia Programming Language.

### Supported Plotting Backends

NOTE: The term "load time" is used loosely below to indicate time to first plot.

- **InspectDR.jl**: One of the fastest solutions with the shortest load times.  InspectDR also provides good interactivity, but is relatively new/untested, and has fewer features than other backends (ex: Matplotlib).
- **Grace/xmgrace**: Short load times and fast when dealing with small datasets.  The GUI feels a bit dated and unfamiliar, but one can readily fine tune almost any visual element to generate publication-quality plots.
- **Matplotlib/PyPlot.jl**: Longer load times (loading anaconda).  Faster than Grace/xmgrace solution when dealing with moderately-sized datasets (~200k points).
- **Qwt/guiqwt**: Longer load times (loading anaconda).  Faster than Matplotlib/PyPlot.jl solution when dealing with moderately-sized datasets (~200k points).
  - guiqwt appears slow when plotting a large *number of traces* (ex: eye diagram of a long transient dataset split into many individual traces).
- **Plots.jl/(\*.jl)**: Uniform plotting interface supporting multiple backends.  In particular, there are signs that GR.jl will potentially be one of the fastest.
  - The GR.jl backend is not yet mature: Does not support subplots, cannot display multiple plot windows, ...

<a name="Installation"></a>
## Installation

1. [Install Julia](https://github.com/ma-laforge/HowTo/tree/master/julia/julia_install.md#Installation)

    - Optional/Workaround: At the time of writing, module `HDF5.jl` does not appear to install the base `HDF5` libraries required by CData.  On Ubuntu systems, the `HDF5` package is installed with the following:

			$ sudo apt-get update
			$ sudo apt-get install libhdf5
			#TODO: Verify package name.

1. Optional: [Install Anaconda distribution of Python 2.7](https://github.com/ma-laforge/HowTo/tree/master/conda/conda_install.md#Py27Installation)

    - Anaconda is required if one is to render plots with Matplotlib/PyPlot.jl or Qwt/guiqwt.

1. Install C-Data Julia modules (Prompts to install python/PyCall-based modules).

		julia> Pkg.clone("https://github.com/ma-laforge/CData.jl.git")
		julia> using CData
		julia> CData.install()

1. Optional backend: [Install Grace](https://github.com/ma-laforge/HowTo/tree/master/grace/grace_install.md#Installation)

    - The installation of Grace is probably the simplest amongst of all backends (excluding InspectDR).
    - That being said, issues were found where GracePlot/Grace interactions cause certain Ubuntu installations to logout the user.  After further reading, the author believes this might have something to do with the X-server.  The issue could only be circumvented by running C-Data from a VMWare session running yet another Ubuntu installation.

1. Optional backend: [Install PyPlot](https://github.com/ma-laforge/HowTo/tree/master/julia/julia_install.md#PyPlot)

1. Optional backend: [Install guiqwt](https://github.com/ma-laforge/HowTo/tree/master/guiqwt/guiqwt_install.md#Py27Installation)

<a name="SampleUsage"></a>
## Sample Usage

:art: **Galleries:** [:satellite: SignalProcessing.jl](https://github.com/ma-laforge/FileRepo/tree/master/SignalProcessing/sampleplots/README.md), [:chart_with_upwards_trend: InspectDR.jl](https://github.com/ma-laforge/FileRepo/tree/master/InspectDR/sampleplots/README.md) (might be out of date).

Examples demonstrating the capabilities of the C-Data toolkit are provided by the following modules:

1. [SignalProcessing.jl](https://github.com/ma-laforge/SignalProcessing.jl): [sample code](https://github.com/ma-laforge/SignalProcessing.jl/tree/master/sample).

 		julia> include(joinpath(Pkg.dir(), "SignalProcessing/sample/runsamples.jl"))

1. [NetwAnalysis.jl](https://github.com/ma-laforge/NetwAnalysis.jl): [sample code](https://github.com/ma-laforge/NetwAnalysis.jl/tree/master/sample).

 		julia> include(joinpath(Pkg.dir(), "NetwAnalysis/sample/runsamples.jl"))

By default, runsamples.jl will render plots using the `InspectDR` backend.  To change the default backend, set the `EASYPLOT_DEFAULTDISPLAY` environment variable, as described in [EasyPlot.jl](https://github.com/ma-laforge/EasyPlot.jl).

### Sample Usage: InspectDR

1. [InspectDR.jl](https://github.com/ma-laforge/InspectDR.jl): [sample code](https://github.com/ma-laforge/InspectDR.jl/tree/master/sample).

 		julia> include(joinpath(Pkg.dir(), "InspectDR/sample/runsamples.jl"))


## Documentation

Documentation is limited at the moment.  See Github pages of corresponding modules for more detail.

**Documentation for Principal Modules**

1. **MDDatasets.jl** - Multi-dimensional datasets & operations:
<br><https://github.com/ma-laforge/MDDatasets.jl>.
1. **CircuitAnalysis.jl** - Basic circuit analysis tools.:
<br><https://github.com/ma-laforge/CircuitAnalysis.jl>.
1. **SignalProcessing.jl** - Step/pulse responses, Fourier transform/series, PRBS sequences, ...:
<br><https://github.com/ma-laforge/SignalProcessing.jl>.
1. **NetwAnalysis.jl** - S/Z/Y/H/G/ABCD parameters, ...:
<br><https://github.com/ma-laforge/NetwAnalysis.jl>.
1. **EasyPlot.jl** - Generic plot objects with simple/succinct build interface:
<br><https://github.com/ma-laforge/EasyPlot.jl>.
1. **EasyData.jl** - Simple/fast(+HDF5) {data, plot} &hArr; file:
<br><https://github.com/ma-laforge/EasyData.jl>.
1. **EDAData.jl** - Access/manipulate data used by EDA tools:
<br><https://github.com/ma-laforge/EDAData.jl>.

**Documentation for Secondary Modules**

1. **FileIO2.jl** - "File Object"-Type Hierarchy:
<br><https://github.com/ma-laforge/FileIO2.jl>.
1. **InspectDR.jl** - Efficient/interactive Julia/Gtk plots:
<br><https://github.com/ma-laforge/InspectDR.jl>.
1. **GracePlot.jl** - Publication-quality plotting for Julia using Grace/xmgrace:
<br><https://github.com/ma-laforge/GracePlot.jl>.
1. **EasyPlotInspect.jl** - Implements EasyPlot.jl rendering Interface using InspectDR.jl:
<br><https://github.com/ma-laforge/EasyPlotInspect.jl>.
1. **EasyPlotGrace.jl** - Implements EasyPlot.jl rendering interface using Grace/xmgrace:
<br><https://github.com/ma-laforge/EasyPlotGrace.jl>.
1. **EasyPlotMPL.jl** - Implements EasyPlot.jl rendering interface using Matplotlib/PyPlot/PyCall:
<br><https://github.com/ma-laforge/EasyPlotMPL.jl>.
1. **EasyPlotQwt.jl** - Implements EasyPlot.jl rendering interface using Qwt/guiqwt/PyCall:
<br><https://github.com/ma-laforge/EasyPlotQwt.jl>.
1. **EasyPlotPlots.jl** - Implements EasyPlot.jl rendering interface using Plots.jl/(\*.jl):
<br><https://github.com/ma-laforge/EasyPlotPlots.jl>.
1. **SpiceData.jl** - Pure-Julia SPICE data file reader:
<br><https://github.com/ma-laforge/SpiceData.jl>.
1. **LibPSF.jl** - Pure-Julia implementation of 3rd party .psf reader:
<br><https://github.com/ma-laforge/LibPSF.jl>.
1. **PSFWrite.jl** - Pure-Julia .psf writer:
<br><https://github.com/ma-laforge/PSFWrite.jl>.

## Known Limitations

The C-Data module is always tracking master branches, making it a relatively unstable platform for development.  This is particularly true when changes are made to the programming interface.

Although `NumericIO` and `InspectDR` are registered modules (can be added with `Pkg.add(...)`), the `CData` installation pulls them in using `Pkg.clone(...)`.  In theory, this ensures no modules are left with an incompatible version.

### Backwards Compatibility

The C-Data suite does not currently provide backwards compatibility for previous versions of Julia.  To use C-Data with older Julia distributions, the user *must* check out older versions of each submodule:

- **Julia-0.4**: Check out version from November 15 2016 (2016 11 15).
  - Tested configuration: Linux / Julia-0.4.5 (64-bit) / Anaconda 2.1.0 (64-bit w/Python 2.7.11)
- **Julia-0.5**: Check out version from May 12th 2017 (2017 05 12).
  - Tested configuration: Linux / Julia-0.5.1 (64-bit) / Anaconda 2.1.0 (64-bit w/Python 2.7.11)
- **Julia-0.6**: Check out version from Aug 1st 2018 (2018 08 01).
  - Tested configuration: Linux / Julia-0.6.0 (64-bit) / Anaconda 2.1.0 (64-bit w/Python 2.7.11)

### Compatibility

Extensive compatibility testing of the C-Data toolkit has not been performed.  The module has been tested using the following environment(s):

- Linux / Julia-0.6.0 (64-bit) / Anaconda 2.1.0 (64-bit w/Python 2.7.11)

## Disclaimer

The C-Data toolkit is not yet mature.  Expect significant changes.

This software is provided "as is", with no guarantee of correctness.  Use at own risk.
