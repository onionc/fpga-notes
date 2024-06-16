/*
    Copyright (C) 2017 Amazon.com, Inc. or its affiliates.  All Rights Reserved.
    Copyright (C) 2012 - 2018 Xilinx, Inc. All Rights Reserved.

    Permission is hereby granted, free of charge, to any person obtaining a copy of
    this software and associated documentation files (the "Software"), to deal in
    the Software without restriction, including without limitation the rights to
    use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
    the Software, and to permit persons to whom the Software is furnished to do so,
    subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software. If you wish to use our Amazon
    FreeRTOS name, please do so in a fair use way that does not cause confusion.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
    FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
    COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
    IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
    CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

    http://www.FreeRTOS.org
    http://aws.amazon.com/freertos









































    1 tab == 4 spaces!
*/

/* FreeRTOS includes. */
#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"
#include "timers.h"
/* Xilinx includes. */
#include "xil_printf.h"
#include "xparameters.h"
#include "xgpiops.h"

#define TIMER_ID	1
#define DELAY_10_SECONDS	10000UL
#define DELAY_1_SECOND		1000UL
#define TIMER_CHECK_THRESHOLD	9


#define EMIO_LED 54 // LED���ӵ���EMIO0
/*-----------------------------------------------------------*/
static void prvLedTask( void *pvParameters );
/*-----------------------------------------------------------*/



XGpioPs gpiops_inst;


void initLed(){

	XGpioPs_Config *gpiops_cfg_ptr;

	// ��������ID��ѯ������Ϣ
	gpiops_cfg_ptr = XGpioPs_LookupConfig(XPAR_XGPIOPS_0_DEVICE_ID); // ͨ�� PS��GPIO����ID ��ѯ

	// ��ʼ����������
	XGpioPs_CfgInitialize(&gpiops_inst, gpiops_cfg_ptr, gpiops_cfg_ptr->BaseAddr);

	// �������
	XGpioPs_SetDirectionPin(&gpiops_inst, EMIO_LED, 1);

	// ʹ�����
	XGpioPs_SetOutputEnablePin(&gpiops_inst, EMIO_LED, 1);


}

int main( void )
{
	const TickType_t x10seconds = pdMS_TO_TICKS( DELAY_10_SECONDS );

	initLed();

	xil_printf( "Hello from Freertos example main\r\n" );


	xTaskCreate( 	prvLedTask, 					/* The function that implements the task. */
					( const char * ) "ledTask", 		/* Text name for the task, provided to assist debugging only. */
					configMINIMAL_STACK_SIZE, 	/* The stack allocated to the task. */
					NULL, 						/* The task parameter is not used, so set to NULL. */
					tskIDLE_PRIORITY,			/* The task runs at the idle priority. */
					NULL );



	/* Start the tasks and timer running. */
	vTaskStartScheduler();

	for( ;; );
}


/*-----------------------------------------------------------*/
static void prvLedTask( void *pvParameters )
{
const TickType_t x1second = pdMS_TO_TICKS( DELAY_1_SECOND );

	for( ;; )
	{
		/* Delay for 1 second. */
		vTaskDelay( x1second );
		XGpioPs_WritePin(&gpiops_inst, EMIO_LED, ~XGpioPs_ReadPin(&gpiops_inst, EMIO_LED));

	}
}


