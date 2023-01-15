@REM ========================================================
@REM Run target executables only once a day.
@REM
@REM Supported executables:
@REM   .exe, .bat, .py (Python env. required)
@REM ========================================================

@REM Get the parent directory of this bat file and move there.
@set base_dir=%~dp0
@pushd "%base_dir%"

@REM Get today's date and remove "/" (e.g. 2023/01/01 -> 20230101)
@set today=%date:/=%

@REM Generate today's log file name.
@set log_prefix=LogStartupOneceADay_
@set todays_log_file=%log_prefix%%today%

@REM Search log files.
@for %%f in (%log_prefix%*) do @(
  if %%f == %todays_log_file% (
    @REM Exit as today's log file exists.
    exit
  ) else (
    @REM Delete past log files.
    del /q %%f
  )
)

@REM --------------------------------------------------------
@REM This batch file has not yet been run today, so run it.
@REM --------------------------------------------------------

@REM TODO

@REM Create today's log file
@type nul > %todays_log_file%
