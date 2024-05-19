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

If absorbances are measured only a minimum number of wavelengths, then OLS
can be used to build a calibration model. For example, if a mixture containing ns
non-reacting species, then absorbances at ns wavelengths need to be measured.
Typically, the wavelengths are chosen corresponding to the maximum absorbing
wavelengths of individual species. However, if we measure absorbances at nw >
ns wavelengths, then the absorbance matrix will not be full column rank. In this
case, Principal Component Regression can be used to develop a multivariate
calibration model. In this method PCA is first applied to the absorbance matrix to
obtain the scores corresponding to different mixtures. In the second step, a
regression model is used to relate the concentrations to the scores using OLS
(assuming concentrations are the dependent variables). In order to use this
model for predicting the concentrations of a mixture whose absorbance spectra is
given, we first obtain the scores and then use the OLS regression model to
predict the concentrations. Note that the true rank of the absorbance matrix is
equal to the number of species in the mixture. 

The quality of the linear calibration model is evaluated using leave-one-sampleout cross-validation (LOOCV) and computing the root mean square error (RMSE)
in predicting the left out sample concentrations. 

We start by picking the first sample out of the five replicates for each mixture to obtain a data
matrix of size 26 x 176. 

![image](https://github.com/ansh63766/Multivariate-Calibration/assets/113677013/d24360eb-d850-41d1-817e-2e441364bf32)

![image](https://github.com/ansh63766/Multivariate-Calibration/assets/113677013/cfbf78de-1220-4b8d-88c9-76a9ab781e30)

![image](https://github.com/ansh63766/Multivariate-Calibration/assets/113677013/d0086d03-e7bd-4610-96c5-ff89d29c2e70)

![image](https://github.com/ansh63766/Multivariate-Calibration/assets/113677013/6e8dd932-689b-4403-8f36-fd25db0c69cc)
![image](https://github.com/ansh63766/Multivariate-Calibration/assets/113677013/662cd8b1-e95c-46f8-94f0-7a7eabb7be8b)

![image](https://github.com/ansh63766/Multivariate-Calibration/assets/113677013/b6a3b1c2-4535-4ca8-9ae1-880ed4149959)
![image](https://github.com/ansh63766/Multivariate-Calibration/assets/113677013/620639ae-1d87-44f1-b211-85e37e0f6302)
![image](https://github.com/ansh63766/Multivariate-Calibration/assets/113677013/112a965a-3f76-42fd-8144-dc5f5ead161f)

![image](https://github.com/ansh63766/Multivariate-Calibration/assets/113677013/f92fb736-e90b-465b-be42-0b4cced99099)
![image](https://github.com/ansh63766/Multivariate-Calibration/assets/113677013/271ea637-de87-45f8-bc03-661887863d12)

