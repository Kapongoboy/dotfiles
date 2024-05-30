# packages on fedora
sudo dnf install hyprland hyprlang hyprlang-devel hyprland-devel brightnessctl polkit-gnome waybar swaybg wofi pulseaudio-utils playerctl grim swappy slurp mako wayland-protocols-devel sdbus-cpp-devel 

# hypr plugins setup

gh repo clone hyprwm/hypridle
gh repo clone hyprwm/hyprlock
gh repo clone hyprwm/hyprpaper

cd hypridle
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -S . -B ./build
cmake --build ./build --config Release --target hypridle -j 4
sudo cmake --install build
cd ../

sudo dnf install cairo-devel libxkbcommon pam-devel file-devel
cd hyprlock
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -S . -B ./build
cmake --build ./build --config Release --target hyprlock -j 4
sudo cmake --install build
cd ../

# just in case
sudo dnf install wayland-devel wayland-protocols-devel hyprlang-devel pango-devel cairo-devel file-devel libglvnd-devel libglvnd-core-devel libjpeg-turbo-devel libwebp-devel gcc-c++

cd hyprpaper
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target hyprpaper -j 4
sudo cmake --install build
cd ../

# config files
mkdir ~/.config/waybar
cp waybar/config.jsonc ~/.config/waybar/config
cp waybar/style.css ~/.config/waybar/style.css

cp -r hypr ~/.config/
cp -r kitty ~/.config/
cp -r wofi ~/.config/
