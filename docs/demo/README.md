# Local output capture

Captured on 2026-10-23 from base source revision `1f8d0f838e7a8ddfad579416ade0c36f3e619918`, with the example and copy changes in this commit.

OCaml 5.3.0, Dune 3.22.2. Twenty-three existing tests passed using local fixtures and test transports. The example decodes synthetic JSON and rejects a malformed signature. It creates no payment and makes no provider request.

The PNG is a browser-rendered transcript of the output saved in output.txt, not a fabricated application UI. Run the included OCaml example with `opam exec -- dune exec examples/demo/main.exe` after setting up the dependencies described in the root README. No credentials or client data appear in the capture.
