!![](../../workflows/gds/badge.svg) ![](../../workflows/docs/badge.svg) ![](../../workflows/test/badge.svg) ![](../../workflows/fpga/badge.svg)

# UWASIC W26: MAC learning table

## Getting Started

1. Clone this repository
2. Update [info.yaml](info.yaml) with your project details
3. Make a post in the [UWASIC Discord server](https://discord.gg/ZcfXmCkV) under **#onboarding/posts** to kick things off!
4. [Read the full documentation and specifications here](https://docs.uwasic.com/doc/frame-transceiver-JYAirn3u7L)

## Disclaimer

The final implementation will be integrated into an FPGA fabric of a larger SoC. This TinyTapeout template serves as a trackable starting point for initial prototyping and team training purposes.

## Set up your Verilog project

1. Add your Verilog files to the `src` folder.
2. Edit the [info.yaml](info.yaml) and update information about your project, paying special attention to the `source_files` and `top_module` properties. 
3. Edit [docs/info.md](docs/info.md) weekly and document your weekly progress on RTL and Verification, along with any comments or concerns you may have.

The GitHub action will automatically build the ASIC files using [OpenLane](https://www.zerotoasiccourse.com/terminology/openlane/).

## Writing cocotb Testbenches

This project has a hierarchical design structure:
- **`frame_sync_tx_rx`** (final top module): Complete Ethernet frame transceiver - *currently not being modified*
  - **`control_transceiver`** (submodule): Control logic connecting TX and RX
    - **`RX_frame`** (current verification target): Receiver frame processing logic
    - **`TX_frame`** (submodule): Transmitter frame processing logic

**For the initial phase of verification, the testbench instantiates `RX_frame` as the default DUT.** This allows you to thoroughly verify the receiver functionality and frame synchronization before integrating it into the higher-level `control_transceiver` and `frame_sync_tx_rx` modules. The test file `test/test.py` contains cocotb test cases that drive the testbench and verify:
- Frame reception and synchronization
- Byte extraction and state management
- Receiver status signals

Once the receiver is fully verified, the next phase will integrate with the transmitter (`TX_frame`) and control logic (`control_transceiver`), then finally with the top-level module (`frame_sync_tx_rx`).

> **Note:** If you're more comfortable using Verilog or SystemVerilog testbenches for verification, feel free to use those instead of cocotb.

## Enable GitHub actions to build the results page

- [Enabling GitHub Pages](https://tinytapeout.com/faq/#my-github-action-is-failing-on-the-pages-part)

## Resources

- [Documentation](https://docs.uwasic.com/doc/frame-transceiver-JYAirn3u7L)

### HDLBits Serial Receiver Design Problems
- [PS/2 Packet Parser](https://hdlbits.01xz.net/wiki/Fsm_ps2)
- [Serial Receiver](https://hdlbits.01xz.net/wiki/Fsm_serial)
- [Serial Receiver with Datapath](https://hdlbits.01xz.net/wiki/Fsm_serialdata)

- [UWASIC discord server](https://discord.gg/ZcfXmCkV)
