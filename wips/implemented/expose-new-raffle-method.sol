 contract ExposeNewRaffle {
    /**
     * @dev   Function which gets current week number and if different
     *        from the global var week number, it updates that and sets
     *        up the new raffle struct. Should only be called once a
     *        week after the raffle is closed. Should it get called
     *        sooner, the contract is paused for inspection.
     *
     */
    function setUpNewRaffle() internal {
        uint newWeek = getWeek();
        if (newWeek == week) return pauseContract(true, 4);
        setWeek(newWeek);
        setUpRaffleStruct(newWeek, tktPrice, BIRTHDAY + (newWeek * WEEKDUR));
    }
	/**
	 * @dev		Sets up new raffle via creating a struct with the correct 
     *          timestamp and ticket price. 
	 *
	 * @param   _week       Desired week number for new raffle struct.
     *
     * @param   _tktPrice   Desired ticket price for the raffle
     *
     * @param    _timeStamp Timestamp of Mon 00:00 of the week of this raffle
     *
	 */
   	function setUpRaffleStruct(uint _week, uint _tktPrice, uint _timeStamp) internal {
        raffle[_week].tktPrice  = _tktPrice;
        raffle[_week].timeStamp = _timeStamp;
   	}
	/**
	 * @dev		Sets the withdraw status of a raffle.
	 *
	 * @param   _week   Week number for raffle in question.
     *
     * @param   _status Desired withdraw status for raffle.
     *
	 */
    function setWithdraw(uint _week, bool _status) internal {
        raffle[_week].wdrawOpen = _status;
    }
    /**
	 * @dev		Sets the global week variable.
	 *
	 * @param   _week   Desired week number.
     *
	 */
    function setWeek(uint _week) internal {
        week = _week;
    }

}

//  /**
//  * @dev   Function which gets current week number and if different
//  *        from the global var week number, it updates that and sets
//  *        up the new raffle struct. Should only be called once a
//  *        week after the raffle is closed. Should it get called
//  *        sooner, the contract is paused for inspection.
//  */
// function newRaffle() internal {
//     uint newWeek = getWeek();
//     if (newWeek == week) {
//         pauseContract(4);
//         return;
//     } else {//∴ new raffle...
//         week = newWeek;
//         raffle[newWeek].timeStamp = BIRTHDAY + (newWeek * WEEKDUR);
//     }
// }

// mapping (uint => rafStruct) public raffle;
// struct rafStruct {
//     mapping (address => uint[][]) entries;
//     uint unclaimed;
//     uint[] winNums;
//     uint[] winAmts;
//     uint timeStamp;
//     bool wdrawOpen;
//     uint numEntries;
//     uint freeEntries;
// }