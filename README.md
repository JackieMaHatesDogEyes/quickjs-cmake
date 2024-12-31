# QuickJS Javascript Engine
### Current Version: 2024-01-13

This repository contains a CMake build system for QuickJS with support for generating a .lib file for Windows so that QuickJS can finally be used in MSVC (Visual Studio) projects.  
This work has been done by **[Victor Adetayo](https://github.com/JackieMaHatesDogEyes)**  
Below are parts of the QuickJS documentation that are relevant to the build process and usage of the QuickJS Javascript Engine. Some parts have been omitted due to the fact that this cmake project doesn't support the `qjs` or `qjsc` executables. The main focus of this project is to provide a library that can be linked to other projects.  

This cmake project currently generates a 1.22mb dll and a 515kb lib file on Windows 11 using MinGW-W64-builds-5.0.0.

You will also have to adjust the NM_TOOL and DLL_TOOL variables in generate_defs.bat to match the location of the tools on your system.

All credit goes to the original author of QuickJS, the awesome [Fabrice Bellard](https://bellard.org/) & [Charlie Gordon](https://github.com/chqrlie/).
## Introduction
QuickJS is a small and embeddable Javascript engine. It supports the ES2023 specification including modules, asynchronous generators, proxies and BigInt. It optionally supports mathematical extensions such as big decimal floating point numbers (BigDecimal), big binary floating point numbers (BigFloat) and operator overloading.


#### Main Features:
- Small and easily embeddable: just a few C files, no external dependency, 210 KiB of x86 code for a simple hello world program.
- Fast interpreter with very low startup time: runs the 76000 tests of the ECMAScript Test Suite in less than 2 minutes on a single core of a desktop PC. The complete life cycle of a runtime instance completes in less than 300 microseconds.
- Almost complete ES2023 support including modules, asynchronous generators and full Annex B support (legacy web compatibility).
- Passes nearly 100% of the ECMAScript Test Suite tests when selecting the ES2023 features. A summary is available at Test262 Report.
- Mathematical extensions: BigDecimal, BigFloat, operator overloading, bigint mode, math mode.
Small built-in standard library with C library wrappers.

## Documentation
- [QuickJS Documentation](https://bellard.org/quickjs/)
- [QuickJS Github](https://github.com/bellard/quickjs)

## Licensing
QuickJS is released under the [MIT license](https://opensource.org/license/MIT).

Unless otherwise specified, the QuickJS sources are copyright Fabrice Bellard and Charlie Gordon.