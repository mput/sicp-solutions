import simulation from '../src';

const { Wire, elements } = simulation;

const setProbe = (name, wire) => {
  wire.addAction(() => {
    console.log(`Wire ${name} changed value to ${wire.getValue()} at time:${simulation.getCurrentTime()}`);
  });
};

const halfAdder = (in1, in2, sum, carry) => {
  const d = new Wire();
  const e = new Wire();
  elements.addInverter(carry, e);
  elements.addOrGate(in1, in2, d);
  elements.addAndGate(in1, in2, carry);
  elements.addAndGate(d, e, sum);
};

const adder = (in1, in2, cin, sum, carry) => {
  const d = new Wire();
  const e = new Wire();
  const c = new Wire();
  halfAdder(in1, d, sum, e);
  halfAdder(in2, cin, d, c);
  elements.addOrGate(e, c, carry);
};


const in1 = new Wire();
const in2 = new Wire();
const cin = new Wire();
const sum = new Wire();
const carry = new Wire();

adder(in1, in2, cin, sum, carry);
setProbe('sum', sum);
setProbe('carry', carry);


in1.setValue(1);
in2.setValue(1);
cin.setValue(1);
simulation.run();
console.log(in1.getValue(), in2.getValue(), cin.getValue(), sum.getValue(), carry.getValue());

cin.setValue(0);
simulation.run();
console.log(in1.getValue(), in2.getValue(), cin.getValue(), sum.getValue(), carry.getValue());

cin.setValue(1);
in1.setValue(0);
in2.setValue(0);
simulation.run();

console.log(in1.getValue(), in2.getValue(), cin.getValue(), sum.getValue(), carry.getValue());
