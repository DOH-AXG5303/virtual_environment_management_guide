# UAT Testing Log
## Fri Mar  7 10:38:50 AM UTC 2025
Initial setup of UAT environment using setup_uat.sh

## Thur Mar 20

Installed uv with pip install uv yesterday, today the install is still available:

EEN0303@workbench-2:~/UAT$ pip install --user uv
Requirement already satisfied: uv in /home/EEN0303/.local/lib/python3.12/site-packages (0.6.8)

EEN0303@workbench-2:~/UAT$ uv venv
bash: uv: command not found
It looks like even though UV is installed via pip in your user directory, it's not in the system PATH
https://docs.posit.co/ide/server-pro/user/vs-code/guide/python-environments.html
EEN0303@workbench-2:~/UAT$ python -m venv .venv
this created a .venv folder in my directory with the bin/, include/, lib/, and lib64/ folders
if i wanted to create a virtual environment with a different name i would have needed to run `python -m venv <env name>`
The .venv name is a common convention that many tools automatically recognize, including VS Code and other IDEs.
If concerned about having multiple projects with virtual environments all named .venv, don't worry - each one exists in its own project directory, so they don't conflict with each other. The environment name is local to the project directory

EEN0303@workbench-2:~/UAT$ source .venv/bin/activate
(.venv) EEN0303@workbench-2:~/UAT$ 

(.venv) EEN0303@workbench-2:~/UAT$ pip install uv
Collecting uv
  Using cached uv-0.6.8-py3-none-manylinux_2_17_x86_64.manylinux2014_x86_64.whl.metadata (11 kB)
Using cached uv-0.6.8-py3-none-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (16.5 MB)
Installing collected packages: uv
Successfully installed uv-0.6.8

[notice] A new release of pip is available: 24.2 -> 25.0.1
[notice] To update, run: pip install --upgrade pip

(.venv) EEN0303@workbench-2:~/UAT$ uv pip install pandas matplotlib seaborn python-dotenv databricks-connect==15.4.*
Resolved 35 packages in 3.47s
Prepared 35 packages in 54.40s
Installed 35 packages in 2.28s
 + cachetools==5.5.2
 + certifi==2025.1.31
 + charset-normalizer==3.4.1
 + contourpy==1.3.1
 + cycler==0.12.1
 + databricks-connect==15.4.7
 + databricks-sdk==0.46.0
 + fonttools==4.56.0
 + google-auth==2.38.0
 + googleapis-common-protos==1.69.2
 + grpcio==1.71.0
 + grpcio-status==1.71.0
 + idna==3.10
 + kiwisolver==1.4.8
 + matplotlib==3.10.1
 + numpy==1.26.4
 + packaging==24.2
 + pandas==2.2.3
 + pillow==11.1.0
 + protobuf==5.29.4
 + py4j==0.10.9.7
 + pyarrow==19.0.1
 + pyasn1==0.6.1
 + pyasn1-modules==0.4.1
 + pyparsing==3.2.1
 + python-dateutil==2.9.0.post0
 + python-dotenv==1.0.1
 + pytz==2025.1
 + requests==2.32.3
 + rsa==4.9
 + seaborn==0.13.2
 + setuptools==77.0.3
 + six==1.17.0
 + tzdata==2025.1
 + urllib3==2.3.0

uv showing impressive speed installing 35 packages including complex ones like pandas, matplotlib, and pyarrow; doing this in seconds is substantially faster than traditional pip. key reasons for uv's greater performance:

parallel download capability
Rust-based implementation with efficient dependency resolution
Optimized package installation process

(.venv) EEN0303@workbench-2:~/UAT$ uv pip freeze > requirements.txt

(.venv) EEN0303@workbench-2:~/UAT$ python workbench/python/package_install_test.py
Python version: 3.12.6 (main, Feb 25 2025, 22:33:32) [GCC 11.4.0]
pandas version: 2.2.3
matplotlib version: 3.10.1
seaborn version: 0.13.2
DataFrame created successfully:
   x   y
0  1  10
1  2  20
2  3  30
All imports successful!

(.venv) EEN0303@workbench-2:~/UAT$ chmod +x workbench/python/environment_reproducibility_test.sh

(.venv) EEN0303@workbench-2:~/UAT$ ./workbench/python/environment_reproducibility_test.sh 
Deactivating current environment (if active)...
Creating environment...
Activating test environment...
Installing from requirements.txt...
Collecting cachetools==5.5.2 (from -r requirements.txt (line 1))
  Downloading cachetools-5.5.2-py3-none-any.whl.metadata (5.4 kB)
Collecting certifi==2025.1.31 (from -r requirements.txt (line 2))
  Downloading certifi-2025.1.31-py3-none-any.whl.metadata (2.5 kB)
Collecting charset-normalizer==3.4.1 (from -r requirements.txt (line 3))
  Downloading charset_normalizer-3.4.1-cp312-cp312-manylinux_2_17_x86_64.manylinux2014_x86_64.whl.metadata (35 kB)
Collecting contourpy==1.3.1 (from -r requirements.txt (line 4))
  Downloading contourpy-1.3.1-cp312-cp312-manylinux_2_17_x86_64.manylinux2014_x86_64.whl.metadata (5.4 kB)
Collecting cycler==0.12.1 (from -r requirements.txt (line 5))
  Downloading cycler-0.12.1-py3-none-any.whl.metadata (3.8 kB)
Collecting databricks-connect==15.4.7 (from -r requirements.txt (line 6))
  Downloading databricks_connect-15.4.7-py2.py3-none-any.whl.metadata (2.5 kB)
Collecting databricks-sdk==0.46.0 (from -r requirements.txt (line 7))
  Downloading databricks_sdk-0.46.0-py3-none-any.whl.metadata (38 kB)
Collecting fonttools==4.56.0 (from -r requirements.txt (line 8))
  Downloading fonttools-4.56.0-cp312-cp312-manylinux_2_5_x86_64.manylinux1_x86_64.manylinux_2_17_x86_64.manylinux2014_x86_64.whl.metadata (101 kB)
Collecting google-auth==2.38.0 (from -r requirements.txt (line 9))
  Downloading google_auth-2.38.0-py2.py3-none-any.whl.metadata (4.8 kB)
Collecting googleapis-common-protos==1.69.2 (from -r requirements.txt (line 10))
  Downloading googleapis_common_protos-1.69.2-py3-none-any.whl.metadata (9.3 kB)
Collecting grpcio==1.71.0 (from -r requirements.txt (line 11))
  Downloading grpcio-1.71.0-cp312-cp312-manylinux_2_17_x86_64.manylinux2014_x86_64.whl.metadata (3.8 kB)
Collecting grpcio-status==1.71.0 (from -r requirements.txt (line 12))
  Downloading grpcio_status-1.71.0-py3-none-any.whl.metadata (1.1 kB)
Collecting idna==3.10 (from -r requirements.txt (line 13))
  Downloading idna-3.10-py3-none-any.whl.metadata (10 kB)
Collecting kiwisolver==1.4.8 (from -r requirements.txt (line 14))
  Downloading kiwisolver-1.4.8-cp312-cp312-manylinux_2_17_x86_64.manylinux2014_x86_64.whl.metadata (6.2 kB)
Collecting matplotlib==3.10.1 (from -r requirements.txt (line 15))
  Downloading matplotlib-3.10.1-cp312-cp312-manylinux_2_17_x86_64.manylinux2014_x86_64.whl.metadata (11 kB)
Collecting numpy==1.26.4 (from -r requirements.txt (line 16))
  Downloading numpy-1.26.4-cp312-cp312-manylinux_2_17_x86_64.manylinux2014_x86_64.whl.metadata (61 kB)
Collecting packaging==24.2 (from -r requirements.txt (line 17))
  Downloading packaging-24.2-py3-none-any.whl.metadata (3.2 kB)
Collecting pandas==2.2.3 (from -r requirements.txt (line 18))
  Downloading pandas-2.2.3-cp312-cp312-manylinux_2_17_x86_64.manylinux2014_x86_64.whl.metadata (89 kB)
Collecting pillow==11.1.0 (from -r requirements.txt (line 19))
  Downloading pillow-11.1.0-cp312-cp312-manylinux_2_28_x86_64.whl.metadata (9.1 kB)
Requirement already satisfied: pip==24.2 in ./test_env/lib/python3.12/site-packages (from -r requirements.txt (line 20)) (24.2)
Collecting protobuf==5.29.4 (from -r requirements.txt (line 21))
  Downloading protobuf-5.29.4-cp38-abi3-manylinux2014_x86_64.whl.metadata (592 bytes)
Collecting py4j==0.10.9.7 (from -r requirements.txt (line 22))
  Downloading py4j-0.10.9.7-py2.py3-none-any.whl.metadata (1.5 kB)
Collecting pyarrow==19.0.1 (from -r requirements.txt (line 23))
  Downloading pyarrow-19.0.1-cp312-cp312-manylinux_2_28_x86_64.whl.metadata (3.3 kB)
Collecting pyasn1==0.6.1 (from -r requirements.txt (line 24))
  Downloading pyasn1-0.6.1-py3-none-any.whl.metadata (8.4 kB)
Collecting pyasn1-modules==0.4.1 (from -r requirements.txt (line 25))
  Downloading pyasn1_modules-0.4.1-py3-none-any.whl.metadata (3.5 kB)
Collecting pyparsing==3.2.1 (from -r requirements.txt (line 26))
  Downloading pyparsing-3.2.1-py3-none-any.whl.metadata (5.0 kB)
Collecting python-dateutil==2.9.0.post0 (from -r requirements.txt (line 27))
  Downloading python_dateutil-2.9.0.post0-py2.py3-none-any.whl.metadata (8.4 kB)
Collecting python-dotenv==1.0.1 (from -r requirements.txt (line 28))
  Downloading python_dotenv-1.0.1-py3-none-any.whl.metadata (23 kB)
Collecting pytz==2025.1 (from -r requirements.txt (line 29))
  Downloading pytz-2025.1-py2.py3-none-any.whl.metadata (22 kB)
Collecting requests==2.32.3 (from -r requirements.txt (line 30))
  Downloading requests-2.32.3-py3-none-any.whl.metadata (4.6 kB)
Collecting rsa==4.9 (from -r requirements.txt (line 31))
  Downloading rsa-4.9-py3-none-any.whl.metadata (4.2 kB)
Collecting seaborn==0.13.2 (from -r requirements.txt (line 32))
  Downloading seaborn-0.13.2-py3-none-any.whl.metadata (5.4 kB)
Collecting setuptools==77.0.3 (from -r requirements.txt (line 33))
  Downloading setuptools-77.0.3-py3-none-any.whl.metadata (6.6 kB)
Collecting six==1.17.0 (from -r requirements.txt (line 34))
  Downloading six-1.17.0-py2.py3-none-any.whl.metadata (1.7 kB)
Collecting tzdata==2025.1 (from -r requirements.txt (line 35))
  Downloading tzdata-2025.1-py2.py3-none-any.whl.metadata (1.4 kB)
Collecting urllib3==2.3.0 (from -r requirements.txt (line 36))
  Downloading urllib3-2.3.0-py3-none-any.whl.metadata (6.5 kB)
Collecting uv==0.6.8 (from -r requirements.txt (line 37))
  Using cached uv-0.6.8-py3-none-manylinux_2_17_x86_64.manylinux2014_x86_64.whl.metadata (11 kB)
Downloading cachetools-5.5.2-py3-none-any.whl (10 kB)
Downloading certifi-2025.1.31-py3-none-any.whl (166 kB)
Downloading charset_normalizer-3.4.1-cp312-cp312-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (145 kB)
Downloading contourpy-1.3.1-cp312-cp312-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (323 kB)
Downloading cycler-0.12.1-py3-none-any.whl (8.3 kB)
Downloading databricks_connect-15.4.7-py2.py3-none-any.whl (2.3 MB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 2.3/2.3 MB 30.3 MB/s eta 0:00:00
Downloading databricks_sdk-0.46.0-py3-none-any.whl (677 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 677.5/677.5 kB 17.2 MB/s eta 0:00:00
Downloading fonttools-4.56.0-cp312-cp312-manylinux_2_5_x86_64.manylinux1_x86_64.manylinux_2_17_x86_64.manylinux2014_x86_64.whl (4.9 MB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 4.9/4.9 MB 7.3 MB/s eta 0:00:00
Downloading google_auth-2.38.0-py2.py3-none-any.whl (210 kB)
Downloading googleapis_common_protos-1.69.2-py3-none-any.whl (293 kB)
Downloading grpcio-1.71.0-cp312-cp312-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (5.9 MB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 5.9/5.9 MB 6.4 MB/s eta 0:00:00
Downloading grpcio_status-1.71.0-py3-none-any.whl (14 kB)
Downloading idna-3.10-py3-none-any.whl (70 kB)
Downloading kiwisolver-1.4.8-cp312-cp312-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (1.5 MB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 1.5/1.5 MB 9.9 MB/s eta 0:00:00
Downloading matplotlib-3.10.1-cp312-cp312-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (8.6 MB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 8.6/8.6 MB 6.4 MB/s eta 0:00:00
Downloading numpy-1.26.4-cp312-cp312-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (18.0 MB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 18.0/18.0 MB 6.5 MB/s eta 0:00:00
Downloading packaging-24.2-py3-none-any.whl (65 kB)
Downloading pandas-2.2.3-cp312-cp312-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (12.7 MB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 12.7/12.7 MB 6.6 MB/s eta 0:00:00
Downloading pillow-11.1.0-cp312-cp312-manylinux_2_28_x86_64.whl (4.5 MB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 4.5/4.5 MB 6.5 MB/s eta 0:00:00
Downloading protobuf-5.29.4-cp38-abi3-manylinux2014_x86_64.whl (319 kB)
Downloading py4j-0.10.9.7-py2.py3-none-any.whl (200 kB)
Downloading pyarrow-19.0.1-cp312-cp312-manylinux_2_28_x86_64.whl (42.1 MB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 42.1/42.1 MB 6.4 MB/s eta 0:00:00
Downloading pyasn1-0.6.1-py3-none-any.whl (83 kB)
Downloading pyasn1_modules-0.4.1-py3-none-any.whl (181 kB)
Downloading pyparsing-3.2.1-py3-none-any.whl (107 kB)
Downloading python_dateutil-2.9.0.post0-py2.py3-none-any.whl (229 kB)
Downloading python_dotenv-1.0.1-py3-none-any.whl (19 kB)
Downloading pytz-2025.1-py2.py3-none-any.whl (507 kB)
Downloading requests-2.32.3-py3-none-any.whl (64 kB)
Downloading rsa-4.9-py3-none-any.whl (34 kB)
Downloading seaborn-0.13.2-py3-none-any.whl (294 kB)
Downloading setuptools-77.0.3-py3-none-any.whl (1.3 MB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 1.3/1.3 MB 7.4 MB/s eta 0:00:00
Downloading six-1.17.0-py2.py3-none-any.whl (11 kB)
Downloading tzdata-2025.1-py2.py3-none-any.whl (346 kB)
Downloading urllib3-2.3.0-py3-none-any.whl (128 kB)
Using cached uv-0.6.8-py3-none-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (16.5 MB)
Installing collected packages: pytz, py4j, uv, urllib3, tzdata, six, setuptools, python-dotenv, pyparsing, pyasn1, pyarrow, protobuf, pillow, packaging, numpy, kiwisolver, idna, grpcio, fonttools, cycler, charset-normalizer, certifi, cachetools, rsa, requests, python-dateutil, pyasn1-modules, googleapis-common-protos, contourpy, pandas, matplotlib, grpcio-status, google-auth, seaborn, databricks-sdk, databricks-connect
Successfully installed cachetools-5.5.2 certifi-2025.1.31 charset-normalizer-3.4.1 contourpy-1.3.1 cycler-0.12.1 databricks-connect-15.4.7 databricks-sdk-0.46.0 fonttools-4.56.0 google-auth-2.38.0 googleapis-common-protos-1.69.2 grpcio-1.71.0 grpcio-status-1.71.0 idna-3.10 kiwisolver-1.4.8 matplotlib-3.10.1 numpy-1.26.4 packaging-24.2 pandas-2.2.3 pillow-11.1.0 protobuf-5.29.4 py4j-0.10.9.7 pyarrow-19.0.1 pyasn1-0.6.1 pyasn1-modules-0.4.1 pyparsing-3.2.1 python-dateutil-2.9.0.post0 python-dotenv-1.0.1 pytz-2025.1 requests-2.32.3 rsa-4.9 seaborn-0.13.2 setuptools-77.0.3 six-1.17.0 tzdata-2025.1 urllib3-2.3.0 uv-0.6.8



The fact that UV itself was installed from the requirements.txt is interesting - it means UV was included in requirements.txt when I ran uv pip freeze. This is actually helpful for others who want to use UV for their own development work.