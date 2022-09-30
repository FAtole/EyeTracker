
from setuptools import setup


with open('README.md') as f:
    readme = f.read()



setup(
    name='EyeTracker',
    version='0.1',
    description='assistant de communication par eye tracker',
    long_description=readme,
    author='Faugère Anatole',
    author_email='faugere.anatole@gmail.com',
    url='https://github.com/FAtole/EyeTracker',
    packages=['ProjectEyeTracker'],
    install_requires=['tkinter']
)
