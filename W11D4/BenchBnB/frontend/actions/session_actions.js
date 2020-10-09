import { signupUser, loginUser, logoutUser } from '../util/session_api_util';

export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER'
export const LOGOUT_CURRENT_USER = "LOGOUT_CURRENT_USER"
export const RECEIVE_SESSION_ERRORS = "RECEIVE_SESSION_ERRORS"

const receiveCurrentUser = (currentUser) => {
    return ({
        type: RECEIVE_CURRENT_USER,
        currentUser
    })
}

const logoutCurrentUser = () => {
    return ({
        type: LOGOUT_CURRENT_USER,
    })
}

export const receiveErrors = (errors) => {
    return({
        type: RECEIVE_SESSION_ERRORS,
        errors
    })
}

export const login = formUser => {
    return (dispatch) => {
        return loginUser(formUser)
            .then(user => {dispatch(receiveCurrentUser(user))})
            .fail(error => {
                dispatch(receiveErrors(error.responseJSON))
            })
    }
}

export const signup = formUser => {
    return (dispatch) => {
        return signupUser(formUser)
            .then(user => {dispatch(receiveCurrentUser(user))})
            .fail(error => {
                dispatch(receiveErrors(error.responseJSON))
            })
    }
}

export const logout = () => {
    return (dispatch) => {
        return logoutUser()
            .then(() => { dispatch(logoutCurrentUser()) })
    }
}