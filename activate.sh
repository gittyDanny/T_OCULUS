# Im Projektordner ausführen: source activate.sh
_pse_project_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
source /opt/ros/jazzy/setup.bash
source "$_pse_project_dir/.venv/bin/activate"
unset _pse_project_dir
