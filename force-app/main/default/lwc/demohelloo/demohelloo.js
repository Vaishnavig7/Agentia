import { LightningElement } from 'lwc';

export default class Demohelloo extends LightningElement {
    greeting = "World";
    changeHandler(event) {
      this.greeting = event.target.value;
    }
}