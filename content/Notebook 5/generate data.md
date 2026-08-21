---
jupyter:
  jupytext:
    formats: ipynb,md
    text_representation:
      extension: .md
      format_name: markdown
      format_version: '1.3'
      jupytext_version: 1.10.1
  kernelspec:
    display_name: Python 3
    language: python
    name: python3
---

```python
import numpy as np
import matplotlib.pyplot as plt
```

```python
x = np.linspace(0,10,int(1e5))
y = 10-x + np.random.normal(scale=1e-3,size=len(x))
y += -np.exp(-(x-5)**2/0.001**2)
y += 300*(x-2)*np.exp(-(x-2)**2/0.001**2)
np.savetxt("example2.dat", np.array([x,y]).T)
```

```python
N = 1000
t = np.linspace(0,10,N)
v = np.random.normal(size=N)+2*t
plt.plot(t,v)
```

```python
np.savetxt("example_data.dat", np.array([t,v]).T)
```

```python
data = np.loadtxt("example_data.dat")
```

```python
t = data[:,0]
```

```python
v = data[:,1]
```

```python
from shutil import copyfile

copyfile("illustration_source_files/call_by_value_vs_call_by_reference-01.png", "cal")

copyfile("illustration_source_files/call_by_value_vs_call_by_reference-02.png", "call_by_reference.png")

copyfile("illustration_source_files/behind_the_scenes.png", "behind_the_scenes.png")
copyfile("illustration_source_files/anatomy_of_an_error.png", "anatomy_of_an_error.png")
```

Exercise dataset

```python
t = np.linspace(0,10,50)
```

```python
v2 = 2*t**2.33 + np.random.normal(size=len(t))*2
plt.plot(t,v2)
```

```python
np.savetxt("exercise_data.dat", np.array([t,v2]).T)
```

```python
plt.plot(t**2.3,v2)
```

```python

```
