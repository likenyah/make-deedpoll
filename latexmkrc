# latexmkrc
# -----------------------------------------------------------------------------

# Use LuaLaTeX.
$pdf_mode = 4;

# We have some custom .cls and .sty files as part of this repository.
ensure_path("TEXINPUTS", join("/", $ENV{PWD}, "texmf//"));

# Add other temporary files to the cleanup rule.
push(@generated_exts, "nav", "snm");
push(@generated_exts, "run.xml");
push(@generated_exts, "vrb");
