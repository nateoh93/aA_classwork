export const RECEIVE_BENCHES = 'RECEIVE_BENCHES';
import * as APIUtil from '../util/bench_api_util'

const receiveBenches = (benches) => {
    return({
        type: RECEIVE_BENCHES,
        benches
    })
};

export const fetchBenches = () => {
    return (dispatch) => {
        return APIUtil.fetchBenches()
            .then(benches => dispatch(receiveBenches(benches)))
    };
};