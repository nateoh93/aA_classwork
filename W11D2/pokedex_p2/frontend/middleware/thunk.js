
export const myThunk = (store) => (next) => (action) => {
//   debugger
  if (typeof action === "function"){
    // debugger
    return action(store.dispatch)
  }
//   debugger
  return next(action)
}


