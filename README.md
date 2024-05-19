# Multivariate calibration model:

### Using:
1. Multilinear regression(OLS)
2. PCR
3. SPCR
4. MLPCR

### RMSE was calculated by custom LOOCV functions

### Multivariate calibration of spectral measurements is a technique that is used in
chemometrics to develop a model relating spectral measurements (obtained
using instruments such as UV, FIR or NIR or MS spectrophotometers) to
properties such as concentration or other properties of species (usually liquid or
gases). The application we consider is to obtain a model relating UV absorbance
spectra to compositions (concentrations) of aqueous mixtures. Such a model is
useful in online monitoring of chemical and biochemical reactions. 

Twenty six samples of different concentrations of a mixture of Co, Cr, and Ni ions
in dilute nitric acid were prepared in a laboratory and their spectra recorded over
the range 300-650 nm using a HP 8452 UV diode array spectrophotometer (data
in Inorfull.mat). (Water and ethanol are generally used as solvents since these
do not absorb in the UV range. Also the nitrate ions do not absorb in this
spectral range. So an aqueous solution of nitric acid is used to dissolve the
metals in this experiment). Five replicates for each mixture were obtained. The
measurements were made at 2 nm intervals giving rise to an absorbance matrix
of size 130 x 176. The concentrations of the 26 samples, which is a 26 x 3
matrix are also given in the data file. In order to predict the concentration of the
mixture using absorbance measurements, it is necessary to build a calibration
model relating concentration of mixtures to its absorbance spectra. According to
Beer-Lambert’s law the absorbance spectra of a dilute mixture is a linear
(weighted) combination of the pure component spectra with the weights
corresponding to the concentrations of the species in the mixture (concentration
units are expressed in moles/lit or millimoles/lit etc.)
