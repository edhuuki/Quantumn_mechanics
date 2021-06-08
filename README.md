# Quantumn Physics and general relativity tools

The purpose of these libraries is to help me build an understanding of the concepts discussed in the textbook.


### Quantization
Using the quantization class to compute various values
This class only works for atoms with a single electron.   

Used for analyzing the states of the hydrogen atom
```matlab
>> q = quantization(1)

q = 

  quantization with properties:

    en: 8.8542e-12
    me: 9.1094e-31
    mp: 1.6726e-27
     h: 6.6261e-34
    hb: 1.0546e-34
    ec: 1.6022e-19
    nc: 1.6022e-19
    ab: 5.2918e-11
    e1: -2.1799e-18
     c: 300000000

>> q.e1/q.ec

ans =

  -13.6056
>>%%These values are in the base units (ex. e1 = 2.18e-18 nm)

```

I trust this value as the agreed upon value is about 13.6 eV


### Other functionality of quantization
Using the previous instance 'q'.  
Again 'e' denotes energy in base units 'ev' denotes energy in electron volts

'l' denotes λ or the notation for wavelength

```matlab
>> q.e_n(2)/q.ec
>> q.ev_n(1)

ans =

  -13.6056

>> q.ev_n(2)

ans =

   -3.4014

>> q.ev_n(4)

ans =

   -0.8503

>> de = q.dev_dn(4,2)

de =

    2.5510

>> q.l_ev(de)*1e9 %%In units of nanometers

ans =

  486.3519


```

