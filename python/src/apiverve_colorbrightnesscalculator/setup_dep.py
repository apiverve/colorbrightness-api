from setuptools import setup, find_packages

setup(
    name='apiverve_colorbrightnesscalculator',
    version='1.2.2',
    packages=find_packages(),
    include_package_data=True,
    install_requires=[
        'requests',
        'setuptools'
    ],
    description='Color Brightness Calculator checks hex color brightness to classify values as light, dark, or medium, returning RGB components. Paid plans add WCAG contrast ratios, luminance scores, and recommended text colors.',
    author='APIVerve',
    author_email='hello@apiverve.com',
    url='https://apiverve.com/marketplace/colorbrightness?utm_source=pypi&utm_medium=referral&utm_content=homepage',
    classifiers=[
        'Programming Language :: Python :: 3',
        'Operating System :: OS Independent',
    ],
    python_requires='>=3.6',
)
