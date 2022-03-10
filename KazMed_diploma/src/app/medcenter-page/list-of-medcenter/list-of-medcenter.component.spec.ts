import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ListOfMedcenterComponent } from './list-of-medcenter.component';

describe('ListOfMedcenterComponent', () => {
  let component: ListOfMedcenterComponent;
  let fixture: ComponentFixture<ListOfMedcenterComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ListOfMedcenterComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ListOfMedcenterComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
