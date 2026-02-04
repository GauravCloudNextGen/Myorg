// pubsub.js
const events = {};  // Store events and listeners

// Register a listener for a specific event
const registerListener = (eventName, callback, context) => {
    if (!events[eventName]) {
        events[eventName] = [];
    }
    events[eventName].push({ callback, context });
};

// Unregister a listener for a specific event
const unregisterListener = (eventName, callback, context) => {
    if (!events[eventName]) return;

    events[eventName] = events[eventName].filter(
        (listener) => listener.callback !== callback || listener.context !== context
    );
};

// Fire an event to all registered listeners
const fireEvent = (eventName, payload) => {
    if (!events[eventName]) return;

    events[eventName].forEach(({ callback }) => {
        callback(payload);  // Call the listener with the payload
    });
};

export { registerListener, unregisterListener, fireEvent };
