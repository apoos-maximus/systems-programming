SHELL 		:= /bin/sh

CCC		:= clang
CCFLAGS 	:= -std=c17
CPPFLAGS	:= -Iinclude

SRC_DIR 	:= src
BIN_DIR 	:= bin
LIB_DIR 	:= lib
OBJ_DIR 	:= obj


LIBS		:= ${wildcard ${LIB_DIR}/*.c}
OBJS		:= ${patsubst ${LIB_DIR}/%.c, ${OBJ_DIR}/%.o, ${LIBS}}

deps		:	preBuild ${OBJS} 

preBuild 	: 
			mkdir -p obj && mkdir -p bin

$(OBJ_DIR)/%.o 	: 	${LIB_DIR}/%.c
				${CCC} ${CCFLAGS} ${CPPFLAGS} -c $< -o $@

ls 		: 	${SRC_DIR}/listFiles.c deps
				${CCC} ${CCFLAGS} ${CPPFLAGS} ${SRC_DIR}/listFiles.c ${OBJS} -o  ${BIN_DIR}/ls


.PHONY		:	clean

clean 		: 
			rm -f ${SRC_DIR}/*.o ${SRC_DIR}/*.gch ${BIN_DIR}/* ${OBJ_DIR}/*
