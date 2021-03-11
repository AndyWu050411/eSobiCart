# eSobiCart
## Environment
Xcode: 12.4

Swift: 5.3.2

## 開發方式
主要以 Interface builder 開發 UI，架構為 Apple MVC。

螢幕方向固定為垂直。

A01-01、A02-01 以 `UITableView` 來呈現，並以 `UINavigationController` 負責兩個頁面之間的跳轉， 使用 Segue 與 Delegate 達成資料傳遞。

資料變動以建立的 `Cart` 型別為主，詳細記錄了每個商品目前選擇的樣式、數量以及單項價格。單項價格會因輸入正確的優惠碼有所更動。A02-01上的價格也同理。
> 撰寫此份文件時，認為A02-01的價格應改為商品本身的單價來顯示。

