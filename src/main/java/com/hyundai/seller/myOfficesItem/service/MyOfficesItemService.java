package com.hyundai.seller.myOfficesItem.service;

import java.util.List;

public interface MyOfficesItemService {

	List<MyOfficesItemVO> selectSellerMyOfficesItemList(MyOfficesItemVO myOfficesItemVO);

	void deleteSellerMyOfficesItem(MyOfficesItemVO myOfficesItemVO);

	void insertSellerMyOfficesItem(MyOfficesItemVO myOfficesItemVO);

}
