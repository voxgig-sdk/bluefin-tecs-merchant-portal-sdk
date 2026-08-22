import { BluefinTecsMerchantPortalEntityBase } from '../BluefinTecsMerchantPortalEntityBase';
import type { BluefinTecsMerchantPortalSDK } from '../BluefinTecsMerchantPortalSDK';
import type { Control } from '../types';
import type { OutputMoveTid, OutputMoveTidCreateData } from '../BluefinTecsMerchantPortalTypes';
declare class OutputMoveTidEntity extends BluefinTecsMerchantPortalEntityBase<OutputMoveTid> {
    constructor(client: BluefinTecsMerchantPortalSDK, entopts: any);
    make(this: OutputMoveTidEntity): OutputMoveTidEntity;
    create(this: any, reqdata?: OutputMoveTidCreateData, ctrl?: Control): Promise<OutputMoveTidEntity>;
}
export { OutputMoveTidEntity };
