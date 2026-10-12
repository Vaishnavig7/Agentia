import { LightningElement } from 'lwc';

export default class FirstComponent extends LightningElement {

    firstName = "Rahul";
    lastName = "Singh";
    fullName = this.firstName + " " + this.lastName;
    city = "Hyderabad";
    state = "Telangana";
    phone = 1231231231;

}