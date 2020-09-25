const FollowToggle = require('./follow_toggle.js')

// document ready callback below
// callback called once for each button.follow-toggle element
$(() => {
    $(".follow-toggle").each((idx, button) => { new FollowToggle($(button))})
});