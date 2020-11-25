# Analysis of depositions in the pdb for XChem molecules

This folder contains files and a jupyter notebook that were used to analyse how many pdb depositions were likely to have resulted from an XChem experiment. 

Caveats:
- All ligands for comparison have been retreived from archived soakdb files and XChemDB. If an experiments molecule was never recorded in a soakdb file, it will not have been counted.  
- Any structures from an XChem screen that do not include a ligand (e.g. apo structures) have not been counted

The details of the analysis can be found in ``match_xcdb_mols_pdb_structures.ipynb``


