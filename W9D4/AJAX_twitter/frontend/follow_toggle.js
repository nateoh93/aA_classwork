class FollowToggle {
    constructor($el) {
        this.$el = $el;
        this.userId = this.$el.data("user-id");
        this.followState = this.$el.data("initial-follow-state");
        this.render();
        this.$el.on('click', this.handleClick.bind(this));        
    }


    render() {
        if (this.followState === "unfollowed") {
            this.$el.text("Follow")
            this.followState === "followed"
            return "Follow!"
        } else {
            this.$el.text("Unfollow")
            this.followState === "unfollowed"
            return "Unfollow!"
        }
    }

    handleClick(event) {
        event.preventDefault()
        debugger
        if (this.render() === "Follow!") {
            return $.ajax( {
                url: `/users/${this.userId}/follow`,
                method: 'POST',
                dataType: 'JSON'
            }).then((data)=> {debugger})
        } else {
            return $.ajax( {
                url: `/users/${this.userId}/follow`,
                method: 'DELETE',
                dataType: 'JSON'
            })
        };
    }
};

module.exports = FollowToggle;