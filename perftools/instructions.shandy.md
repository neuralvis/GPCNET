## Setup Env

```
module restore PrgEnv-cray
module load perftools-base perftools
```

## Build command

make all CC=`which cc` CXX=`which CC` FLAGS="-DVERBOSE"

## Instrument the executable

```bash
# sampling experiment
pat_build -Drtenv=PAT_RT_SUMMARY=1 -Drtenv=PAT_RT_TRACE_HOOKS=1 network_load_test
pat_build -Drtenv=PAT_RT_SUMMARY=1 -Drtenv=PAT_RT_TRACE_HOOKS=1 network_test

# tracing experiment
pat_build -g mpi -Drtenv=PAT_RT_SUMMARY=1 -Drtenv=PAT_RT_TRACE_HOOKS=1 -u network_load_test
pat_build -g mpi -Drtenv=PAT_RT_SUMMARY=1 -Drtenv=PAT_RT_TRACE_HOOKS=1 -u network_test

```

### Notes

* `-Drtenv=PAT_RT_TRACE_HOOKS=1` enables data from compiler hooks (i.e. `-finstrument-loops` above) to be captured in the craypat output
* Using `-Drtenv=PAT_RT_SUMMARY=0` - i.e. disabling runtime summarization and data aggregation will **not** print any loop data
