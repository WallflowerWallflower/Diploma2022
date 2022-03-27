import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { BehaviorSubject, filter, find, map, of } from 'rxjs';
import { RequestService } from 'src/app/request.service';

export type DoctorType = {
  fullname: string;
  class: string; // type of doctor
  email: string;
  address?: {
    longitude: string;
    latitude: string;
  };
  rating: number;
  profileImgUrl?: string;
  additionalInfo: {
    about?: string;
    qualifications?: string[];
    services?: string[];
    reviews: ReviewType[];
    fees?: any;
  };
};

export type ReviewType = {
  username: string;
  comment: string;
  datePublish: Date;
};

@Component({
  selector: 'app-service-page',
  templateUrl: './service-page.component.html',
  styleUrls: ['./service-page.component.css'],
})
export class ServicePageComponent implements OnInit {
  public valueOptions: string[] = ['rating', 'increase', 'decrease'];

  public dataSelect$: BehaviorSubject<any> = new BehaviorSubject<any>([]);

  dataCard: any = [];
  index: any = this.dataCard.index;
  cardDetails: any = [];

  constructor(private reqService: RequestService) {}

  ngOnInit(): void {
    this.reqService.getUsers().subscribe((data: any) => {
      this.dataCard = data;
    });
  }

  sortBySelect(value: string): any {
    const dataSorting$ = of(this.dataCard);
    switch (value) {
      case 'rating':
        dataSorting$
          .pipe(
            map((items: any) => {
              let ratesSort: any = [];
              items.map((item: any) => {
                ratesSort.push(item);
              });
              ratesSort.sort((a: any, b: any): any =>
                a.rating < b.rating ? -1 : 1
              );
              return ratesSort;
            })
          )
          .subscribe((ratesNext) => this.dataCard = ratesNext);
        break;
      case 'increase':
        dataSorting$
          .pipe(
            map((items: any) => {
              let namesSort: string[] = [];
              items.map((item: any) => {
                namesSort.push(item);
              });
              namesSort.sort((a: any, b: any): any =>
                a.fullname < b.fullname ? -1 : 1
              );
              return namesSort;
            })
          )
          .subscribe((nextInc) => (this.dataCard = nextInc));
        break;
      case 'decrease':
        console.log(value);
        break;
      default:
        return value;
    }
  }

  onSelect(id: number) {
    this.reqService
      .getUsers()
      .pipe(
        map((item) => {
          let ids: any = [];
          item.map((el: any) => {
            if (el.id === id) {
              ids.push(el);
            }
          });
          return ids;
        })
      )
      .subscribe((data) => (this.cardDetails = data));
  }
}
