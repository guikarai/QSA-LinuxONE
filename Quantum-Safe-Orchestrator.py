# *****************************************************************************************************
# QUANTUM-SAFE ON IBM Z AND LINUXONE WITH IBM
# AUTHOR: GUILLAUME HOAREAU
# PURPOSE OF THE FOLLOWING SCRIPT IS TO EXECUTE ALL FOUND .sh SCRIPTS IN THE LOCAL FOLDER
# ORCHESTRATOR
# *****************************************************************************************************

#How It Works:
#--The script scans the current folder for .sh files.
#--It iterates through the list and attempts to execute each script using subprocess.run().
#--If a script executes successfully, its status is updated to Done.
#--If a script fails, it logs the error and moves on to the next script.
#--After all scripts have been attempted, a summary of their execution status is displayed.

import os
import subprocess
import time

def execute_scripts():
    script_folder = os.path.dirname(os.path.abspath(__file__))  # Get the current folder
    script_files = [f for f in os.listdir(script_folder) if f.endswith(".sh")]  # List all .sh scripts
    
    execution_status = {}  # Dictionary to store execution status
    
    for script in script_files:
        script_path = os.path.join(script_folder, script)
        execution_status[script] = "Executing"
        print(f"Executing: {script}")
        
        try:
            result = subprocess.run(["bash", script_path], capture_output=True, text=True, check=True)
            execution_status[script] = "Done"
            print(f"Done: {script}\nOutput:\n{result.stdout}")
        except subprocess.CalledProcessError as e:
            execution_status[script] = "Error"
            print(f"Error: {script}\nError Message:\n{e.stderr}")
        
        time.sleep(1)  # Small delay between script executions
    
    print("\nExecution Summary:")
    for script, status in execution_status.items():
        print(f"{script}: {status}")

if __name__ == "__main__":
    execute_scripts()
