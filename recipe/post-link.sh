# When cross-compiling, or installing for a different platform, package binaries cannot be executed
# See similar issue with gdk-pixbuf
# https://github.com/conda-forge/gdk-pixbuf-feedstock/issues/23
"${PREFIX}/bin/glib-compile-schemas" "${PREFIX}/share/glib-2.0/schemas" 2>> "${PREFIX}/.messages.txt" || \
(
  echo "ERROR: Failed to run glib-compile-schemas"
  echo "To fix this, activate the environment and run:"
  echo "    glib-compile-schemas ${CONDA_PREFIX}/share/glib-2.0/schemas"
) >> "${PREFIX}/.messages.txt"
"${PREFIX}/bin/gtk4-update-icon-cache" -f -t "${PREFIX}/share/icons/hicolor" 2>> "${PREFIX}/.messages.txt" || \
(
  echo "ERROR: Failed to run gtk4-update-icon-cache"
  echo "To fix this, activate the environment and run:"
  echo "    gtk4-update-icon-cache -f -t ${CONDA_PREFIX}/share/icons/hicolor"
) >> "${PREFIX}/.messages.txt"
"${PREFIX}/bin/gio-querymodules" "${PREFIX}/lib/gtk-4.0/4.0.0/printbackends" 2>> "${PREFIX}/.messages.txt" || \
(
  echo "ERROR: Failed to run gio-querymodules"
  echo "To fix this, activate the environment and run:"
  echo "    gio-querymodules ${CONDA_PREFIX}/lib/gtk-4.0/4.0.0/printbackends"
) >> "${PREFIX}/.messages.txt"
