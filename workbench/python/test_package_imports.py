# test_package_imports.py
import sys
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import databricks.connect
from dotenv import load_dotenv

# Print versions to verify specific versions were installed
print(f"Python version: {sys.version}")
print(f"pandas version: {pd.__version__}")
print(f"matplotlib version: {plt.matplotlib.__version__}")
print(f"seaborn version: {sns.__version__}")

# Basic functionality test
df = pd.DataFrame({'x': [1, 2, 3], 'y': [10, 20, 30]})
print("DataFrame created successfully:")
print(df.head())

print("All imports successful!")
