import os
import re
import sys
import time
import datetime
import numpy as np
import pandas as pd
import seaborn as sns
import statsmodels.formula.api as smf
from tqdm import tqdm
from scipy.stats import t as tstat
from scipy.stats import norm
from matplotlib.font_manager import FontProperties
from dateutil.relativedelta import relativedelta

import warnings
warnings.simplefilter(action='ignore', category=FutureWarning)

current_directory = os.path.dirname(os.getcwd()) 
data_folder = os.path.normpath(os.path.join(current_directory + "/data"))
materials_folder = os.path.normpath(os.path.join(current_directory + "/materials"))