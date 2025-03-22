import { LightningElement } from 'lwc';

export default class NavBarParentComponent extends LightningElement {
    selectedPlayer=null;
    navList = [
        {
            id: 1,
            name: 'Virat Kohli',
            imgUrl:
                'https://cloudnextgen2-dev-ed.develop.my.salesforce.com/_slds/images/themes/lightning_blue/lightning_blue_profile_avatar_200.png',
            country: 'India',
            rating: '922',
            position: '1',
            selected: false
        },
        {
            id: 2,
            name: 'Steven Smith',
            imgUrl:
                'https://cloudnextgen2-dev-ed.develop.my.salesforce.com/_slds/images/themes/lightning_blue/lightning_blue_profile_avatar_200.png',
            country: 'Australia',
            rating: '913',
            position: '2',
            selected: false
        },
        {
            id: 3,
            name: 'Kane Williamson',
            imgUrl:
                'https://cloudnextgen2-dev-ed.develop.my.salesforce.com/_slds/images/themes/lightning_blue/lightning_blue_profile_avatar_200.png',
            country: 'New Zealand',
            rating: '887',
            position: '3',
            selected: false
        },
        {
            id: 4,
            name: 'Joe Root',
            imgUrl:
                'https://cloudnextgen2-dev-ed.develop.my.salesforce.com/_slds/images/themes/lightning_blue/lightning_blue_profile_avatar_200.png',
            country: 'England',
            rating: '710',
            position: '4',
            selected: false
        },
        {
            id: 5,
            name: 'David Warner',
            imgUrl:
                'https://cloudnextgen2-dev-ed.develop.my.salesforce.com/_slds/images/themes/lightning_blue/lightning_blue_profile_avatar_200.png',
            country: 'Australia',
            rating: '687',
            position: '5',
            selected: false
        }
    ];
    selectedNavHandler(event){
        const playerName = event.detail;
        this.selectedPlayer = this.navList.find(
            item=> item.name === playerName
        );
    }   
}