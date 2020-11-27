import subprocess

for i in [1, 2, 3, 4, 5, 6, 7, 8, 9]:
    for j in [1, 2, 3, 4, 5, 6, 7, 8, 9]:
        command = f'module load global/cluster && qsub ./example_script.sh {i} {j}'
        subprocess.run(command,
                       stdout=subprocess.PIPE,
                       stderr=subprocess.PIPE,
                       shell=True,
                       executable='/bin/bash')
