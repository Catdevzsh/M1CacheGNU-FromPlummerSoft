#!/bin/bash

# EMUCACHE v0 ASCII art message
echo "  _____                                _              ___  "
echo " | ____|_ __ ___  _   _  ___ __ _  ___| |__   ___    / _ \\ "
echo " |  _| | '_ \` _ \\| | | |/ __/ _\` |/ __| '_ \\ / _ \\  | | | |"
echo " | |___| | | | | | |_| | (_| (_| | (__| | | |  __/  | |_| |"
echo " |_____|_| |_| |_|\\__,_|\\___\\__,_|\\___|_| |_|\\___|   \\___/ "
echo "                                                           "
echo "                  Flames Labs 20XX                        "

# Set timer to 3 seconds
echo "Initializing EMUCACHE v0..."
sleep 3

# Set RAM disk size to 8GB
RAM_DISK_SIZE_MB=8192

# Define RAM disk mount point
RAM_DISK_MOUNT_POINT="/mnt/ramdisk"

# Function to create and mount RAM disk
create_ram_disk() {
    echo "Creating RAM disk..."
    if [[ -d "$RAM_DISK_MOUNT_POINT" ]]; then
        umount $RAM_DISK_MOUNT_POINT
        rm -rf $RAM_DISK_MOUNT_POINT
    fi
    mkdir -p $RAM_DISK_MOUNT_POINT
    mount -t tmpfs -o size="${RAM_DISK_SIZE_MB}M" tmpfs $RAM_DISK_MOUNT_POINT
    echo "RAM disk created and mounted at $RAM_DISK_MOUNT_POINT."
}

# Function to clear caches
clear_caches() {
    echo "Clearing system and user caches..."
    find / \( -name ".cache" -or -name "cache" \) -exec rm -rf {} +
    echo "Cache clearing complete."
}

# Function to free up memory
free_up_memory() {
    echo "Freeing up memory..."
    sync && echo 3 > /proc/sys/vm/drop_caches
    echo "Memory freed."
}

# Function to optimize disk usage
optimize_disk_usage() {
    echo "Optimizing disk usage..."
    fsck -f -y /
    echo "Disk optimization complete."
}

# Easter egg function
easter_egg() {
    if [[ "$1" == "flames" ]]; then
        echo "Congratulations! You found the hidden Easter egg!"
        echo "  _____ _                             _           _         "
        echo " |  ___| | __ _ _ __ ___   ___  ___  | |     __ _| |__  ___ "
        echo " | |_  | |/ _\` | '_ \` _ \\ / _ \\/ __| | |    / _\` | '_ \\/ __|"
        echo " |  _| | | (_| | | | | | |  __/\\__ \\ | |___| (_| | |_) \\__ \\"
        echo " |_|   |_|\\__,_|_| |_| |_|\\___||___/ |______\\__,_|_.__/|___/"
        echo "                                                            "
    fi
}

# Main function
main() {
    create_ram_disk
    clear_caches
    free_up_memory
    optimize_disk_usage
    easter_egg $1
    echo "EMUCACHE v0 optimization tasks completed."
    echo "[C] Flames Labs 20XX - Have a radical day/night. Peace out!"
}

main $1
