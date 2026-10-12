import { LightningElement } from 'lwc';

export default class Firstdemo extends LightningElement {

    greeting = "World";
    changeHandler(event) {
      this.greeting = event.target.value;
    }
}