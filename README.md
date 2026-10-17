# btrees

BTrees for [polpo](https://github.com/polpo-system/polpo): B-trees in files, with number keys or string keys, each mapping to a position (`BTrees`). HyperDocs keeps its link index with them.

```
portia.Install btrees
```

## What is here

    src/BTrees.Mod
    test/BTreesTest.Mod

The source comes from ETH Linux Oberon (OLR, 2017-06-18), converted from an Oberon text to plain
text; the first commit has it unchanged. It compiles unchanged with all five of polpo's compilers
(x86, ARM, ARMv7, RISC-V, MIPS).

## Tests

    BTreesTest.Run      4 checks: 500 numbers inserted and searched, the file opened again,
                        a string key; no display needed

The license is GPL-3 (`LICENSE`); the code comes from ETH Oberon, whose license (`LICENSE.ETH`)
asks to keep its copyright notice and conditions, which `LICENSE.ETH` does.
