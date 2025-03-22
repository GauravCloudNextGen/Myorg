import { LightningElement } from 'lwc';

export default class BusinessCardParentComponent extends LightningElement {
    userDetails = [
        {
            name: 'John Doe',
            title: 'CEO & Founder',
            company: 'Harvard University, example',
            buttontext: 'Contact',
            imageUrl: './team1.jpg'
        },
        {
            name: 'Steve Smith',
            title: 'CEO & Founder',
            company: 'Standford University, example',
            buttontext: 'Contact',
            imageUrl: 'https://via.placeholder.com/150'
        },
        {
            name: 'David Warner',
            title: 'CEO & Founder',
            company: 'Sydney University, example',
            buttontext: 'Contact',
            imageUrl: 'https://via.placeholder.com/150'
        },
        {
            name: 'Peter Parker',
            title: 'CEO & Founder',
            company: 'Melbourne University, example',
            buttontext: 'Contact',
            imageUrl: 'https://via.placeholder.com/150'
        }
    ]
}