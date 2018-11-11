import elements from './elements';
import Wire from './Wire';

class Simulation {
  constructor() {
    this.currentTime = 0;
    this.atTimeActions = {};

    this.elements = {};
    Object.keys(elements).forEach((element) => {
      this.elements[element] = elements[element](this);
    });
    this.Wire = Wire;
  }

  getCurrentTime() {
    return this.currentTime;
  }

  addDelayedAction(delay, action) {
    const actionTime = this.currentTime + delay;
    if (Object.prototype.hasOwnProperty.call(this.atTimeActions, actionTime)) {
      this.atTimeActions[actionTime].push(action);
      return;
    }
    this.atTimeActions[actionTime] = [action];
  }

  run() {
    console.log(`Start simulation from time ${this.getCurrentTime()}.`);
    while (Object.keys(this.atTimeActions).length > 0) {
      const minTime = Math.min(...Object.keys(this.atTimeActions).map(Number));
      this.currentTime = minTime;
      this.atTimeActions[minTime].forEach(action => action());
      delete this.atTimeActions[minTime];
    }
  }
}

export default new Simulation();
