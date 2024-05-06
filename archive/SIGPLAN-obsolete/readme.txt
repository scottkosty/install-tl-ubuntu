This file is obsolete.

A newer (still obsolete) version of this file is here:

  https://www.sigplan.org/sites/default/files/sigplanconf/3.6/sigplanconf.cls

The following was removed from install-tl-ubuntu and instead we just archive the older version.

(
  # (https://www.sigplan.org/Resources/LaTeXClassFile/)
  #
  # "The sigplanconf format was used for SIGPLAN events occuring before
  # August 2017. It has been superceded by the acmart format. This page
  # archives older versions of the LaTeX class file for historical
  # reference only."
  mkdir sigplan && cd sigplan &&
  ${WGET_CMD} "https://www.sigplan.org/sites/default/files/sigplanconf/3.6/sigplanconf.cls" \
) >&3 2>&1 \
|| { echo "${WARNINGPREFIX}failed to download sigplan files." >&2; MAINRET=1; }

