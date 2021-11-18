#!/bin/bash
cat <<EOF
window.VUE_APP_AUTH_URL="${VUE_APP_AUTH_URL}"
window.VUE_APP_PRODUCTS_URL="${VUE_APP_PRODUCTS_URL}"
window.INSTANA_reportingUrl="${INSTANA_reportingUrl}"
window.INSTANA_eumjs="${INSTANA_eumjs}"
window.INSTANA_key="${INSTANA_key}"
EOF