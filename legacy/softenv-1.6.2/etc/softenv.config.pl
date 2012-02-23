# softenv.config.pl $
#
# This is the file that is modified to configure SoftEnv. 
#
# **Important Note**: This file is also used by shell scripts to define
# variables, despite the .pl suffix.  Therefore some rules apply
# to these 12 scalar definitions:
#
# 1) There must be no indentation
# 2) There must not be any spaces in any values assigned, they will be
#   truncated.
# 3) You can use previous variables to set other vars, as is probably
#   shown below
#
$package_name = "SoftEnv";
$version      = "SOFTENV_VERSION";
$prefix       = "SOFTENV_PREFIX";

# source databases
$dbpath    = "SOFTENV_ETC_DIR";
$system_db = "$dbpath/softenv.db";
$auto_db   = "$dbpath/soft-auto.db";

# compiled database
$database = "$dbpath/softenv.dbc";

# compiled test database
$test_database = "$dbpath/soft.test.dbc";

# html log
$htmllog = "/homes/bailey/public_html/soft.blah.html";

# location of user's SoftEnv run control file
$default_softfile = "$HOME/SOFTENVRC";
$nosoftfile = "$HOME/.nosoft";

# default contents for empty/missing .software files
@softdef  = ('@default');

# the file to copy when the user needs a new .soft file
$template_softfile = "";

$arch_id_program = "/bin/whatami";

# These are the architectures you intend to support with this SoftEnv installation.s
# Assumes the $arch_id_program returns one of these strings. 
# After changing this list you must recompile your databases (soft-msd).
%supported = (
    "aix-5"             => 1,
    "solaris-9"         => 1,
    "linux-sles8-ia64"  => 1,
);

