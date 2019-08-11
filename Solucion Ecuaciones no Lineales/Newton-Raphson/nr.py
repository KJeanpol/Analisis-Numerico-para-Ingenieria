# -*- coding: utf-8 -*-
"""
Editor de Spyder

Este es un archivo temporal.
"""

import numpy as np
import matplotlib.pyplot as plt

def h(x):
    return np.sin(x)

x=np.linspace(0,10,100)
plt.plot(x,h(x))
