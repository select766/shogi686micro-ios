//
//  micro.hpp
//  Shogi686MicroiOS
//
//  Created by Masatoshi Hidaka on 2022/05/11.
//

#ifndef micro_hpp
#define micro_hpp

#include <stdio.h>
#ifdef __cplusplus
extern "C" {
#endif

typedef void message_cb(const char* msg);
int micro_main(const char* server_ip, int server_port, message_cb cb);

#ifdef __cplusplus
}
#endif
#endif /* micro_hpp */
