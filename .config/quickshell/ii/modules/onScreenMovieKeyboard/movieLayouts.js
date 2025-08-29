// Movie keyboard layouts for video playback controls
// We're going to use ydotool
// See /usr/include/linux/input-event-codes.h for keycodes

const defaultLayout = "Movie Controls";
const byName = {
    "Movie Controls": {
        name_short: "Movie",
        description: "Media controls for video playback",
        comment: "Essential keys for watching movies",
        keys: [
            [
                { keytype: "normal", label: "←", shape: "normal", keycode: 105 },
                { keytype: "normal", label: "──", shape: "space", keycode: 57 },
                { keytype: "normal", label: "→", shape: "normal", keycode: 106 },
            ],
        ],
    },
};

if (typeof module !== "undefined" && module.exports) {
    module.exports = { byName, defaultLayout };
} else {
    // For QML context
    // eslint-disable-next-line no-implicit-globals, no-undef
    globalThis.MovieLayouts = { byName, defaultLayout };
}
