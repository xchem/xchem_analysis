# XChem Job Submissions

## Brief guide on qsub
To use the queue scheduler at Diamond specifically we need to use `module load global/cluster` which contains the relevant queue scheduling software.
Currently (as of 2020) Diamond uses an SGE queue scheduler so if you need to google particular things related to grid engines you might need to include SGE in the search terms!

## Basic Usage
To use qsub you first need to put all the commands you would like to run inside a bash script like so:
```bash
#!/bin/bash
# My Script that contains the commands I want to run
# Arguments I want to give to qsub:
#$ -cwd
#$ -j y
#$ -N MySGEJob
#$ -M tyler@diamond.ac.uk
#$ -m be
#$ -o ~/MySGEJob.out
source activate myenv
python analysis.py $1 $2
```
And then we run the job with:
```bash
module load global/cluster
qsub ./myscript.sh arg1 arg2
```

The structure of the job script is as follows:
Any line starting with `#$` will be considered as an argument for qsub and some of the arguments we can use are described below.
Also in the example script we supply two arguments `arg1` and `arg2` which are passed down into our python script as `$1` and `$2`. You can have as many arguments as you like.

This covers the basic usage of bash and really how an SGE job submission works.

Alternatively: if you don't want to fill your bash script with arguments you can provide the arguments at the command line level which is useful if you are using a wrapper.
```bash
qsub -j y -cwd -N Jobbo -M tyler@diamond.ac.uk -m be ./myscript.sh arg1 arg2
```

### Some Arguments
* `-cwd`	Makes SGE run the job from the current directory.

* `-j y`	Tells SGE to merge the standard error stream with the standard output stream.

* `-S /bin/bash`	Forces SGE to use bash (could be #$ -S /bin/csh or ksh if you want it to run in csh/ksh rather than bash).

* `-N <job name>`	Sets the job name that will appear in `qstat` output.

* `-q <queue name(s)>`	Indicates which queue to use. This can be a single queue or set of queues separated by commas.

* `-l <resource list>`	Alters the target resources or range of resources for the job. Resources that can be set include:

* `mem_free=xG` (request an amount of ram for the job. NOTE: this only applies when the job starts running, it will not reserve the RAM for the duration of the job)

* `h_cpu=h:m:s` (set limit by which time the job must finish - it is terminated if this time is exceeded)

* `scr_free=xG` (requests compute nodes with this amount of free disk space available locally)

* `slots=x` (requests multiple slots for the job - parallel environments only)

Multiple requirements can either be on separate lines or a single line separated by commas, eg: `-l h_cpu=2:30:00,mem_free=10G,scr_free=12G`

* `-pe <env> <n CPUs>`	Requests a parallel environment. <env> must be one of mpi, mpich or orte. Number of CPUs can either be a single number or a range (eg 4 or 2-4)

* `-M <email address>`	Tells SGE to email the specified address when the job is completed (requires -m option as well).

* `-m b|e|a|s`	Flags which events to notify on (b-begin, e-complete, a-abort, s-suspend).

* `-a 0604262300`	Asks SGE to start the job at a certain time (in this example at 23:00 on 26/04/2006). The format is yyMMDDhhmm.

* `-v DISPLAY`	Passes the environment variable specified (in this case the DISPLAY variable).

* `-V`	Passes all environment variables to the job.

* `-i <input file>`	Defines the standard input stream as coming from the file specified.†

* `-o <output file>`	Redirects standard output stream to the file specified†

* `-e <error file>`	Redirects standard error stream to the file specified†

* `-w v`	Tests job syntax without submitting it.

* `-r y`	Flags whether the job can be rerun automatically should it be aborted (eg if the node it is running on crashes and the job fails, it will be automatically restarted by the grid engine.

* `-hold_jid <jobid>`	Holds the job until the job with <jobid> has finished.

* `-t <start>-<end>`	Used for array submission (see below).

* `-tc <limit>`	Restricts the number of simultaneous tasks being run by an array submission (see array submission below).

* `-b y`	Tells the grid engine to recognise the call as a command rather than a script (see QSUB (via command line) below).

* `-sync y`	Tells qsub not to exit until the job has finished (ie you will not be returned to the command line until the job finishes (useful if you are making multiple submissions and want each submission to finish before the next one starts).