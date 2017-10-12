
／*只支持字典转模型*/
NSDictionary *dic = @{@"data":@{@"firstName":@"sun",@"secondName":@"dan",@"subData":@{@"eeName":@"sun",@"ddName":@"april"}},
                      @"id":@"100",
                      @"name":@"suapri",
                      @"age":@"18",
                      @"sex":@"female",
                      @"address":@"BeiJing",
                      @"height":@"160cm",
                      @"weight":@"90",
                      @"workAddress":@"wangjing"
                     };
Model *model = [Model sd_setModelWithDic:dic];
